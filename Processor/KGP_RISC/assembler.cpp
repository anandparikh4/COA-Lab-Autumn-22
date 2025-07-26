#include <bits/stdc++.h>
using namespace std;
/*
1> All valid instructions must begin with an english letter (uppercase or lowercase)
2> No tabs used in program. No comments allowed
3> Each line is either a label or an instruction but not both.
*/

using ll = long long;
set <ll> label_indices;
map <string,ll> mp_label;
map <string,string> reg_map,format_map;

string get_5_bit_string(int x){
	return bitset<5>(x).to_string();
}

void build_format_map(){
	map <string,string> &mp = format_map;
	//shllv, shrlv , shrav, diff,AND,XOR
	mp["add"] = mp["comp"] = mp["shllv"] = mp["shrlv"] = mp["shrav"] = mp["diff"] = mp["and"] = mp["xor"] = "R";
	mp["shll"] = mp["shrl"] = mp["shra"] = "R";
	mp["addi"] = mp["compi"] = mp["lw"] = mp["sw"] = "I";
	// br,bltz,bz,bnz
	mp["br"] = mp["bltz"] = mp["bz"] = mp["bnz"] = "B";
	//b,bl,bcy,bncy
	mp["b"] = mp["bl"] = mp["bcy"] = mp["bncy"] = "J";
}


void build_reg_map(){
	reg_map.clear();
	string s1 = "$a", s2 = "$t", s3 = "$s", s4 = "$k";
	reg_map["$zero"] = get_5_bit_string(0);
	reg_map["$at"] = get_5_bit_string(1);
	reg_map["$v0"] = get_5_bit_string(2);
	reg_map["$v1"] = get_5_bit_string(3);

	for(ll i=0;i<4;i++){
		string s = s1 + to_string(i);
		reg_map[s] = get_5_bit_string(i+4);
	}

	for(ll i=0;i<8;i++){
		string s = s2 + to_string(i);
		reg_map[s] = get_5_bit_string(i+8);

		s = s3 + to_string(i);
		reg_map[s] = get_5_bit_string(i+16);
	}

	reg_map["$t8"] = get_5_bit_string(24);
	reg_map["$t9"] = get_5_bit_string(25);

	reg_map["$k0"] = get_5_bit_string(26);
	reg_map["$k1"] = get_5_bit_string(27);

	reg_map["$gp"] = get_5_bit_string(28);
	reg_map["$sp"] = get_5_bit_string(29);
	reg_map["$fp"] = get_5_bit_string(30);
	reg_map["$ra"] = get_5_bit_string(31);
}

pair<string,ll> give_first_word(string &s){
	ll idx = 0;
	while(idx < (ll)s.length()){
		if(!((s[idx] >= 'a' && s[idx] <= 'z') || (s[idx] >= 'A' && s[idx] <= 'Z') || (s[idx]>='0' && s[idx]<='9') || s[idx]=='_'))break;
		idx++;
	}
	string temp = s.substr(0,idx);
	return {temp,idx-1};
}

void process_labels(string filename){
	string temp;
	ifstream file(filename);
	ll pc = 5;
	while(getline(file,temp)){
		if((temp[0] >= 'a' && temp[0] <= 'z') || (temp[0] >= 'A' && temp[0] <= 'Z')){
			auto it = give_first_word(temp);
			string &s = it.first;
			
			if(temp[it.second+1] == ':'){
				label_indices.insert(pc);
				mp_label[s] = pc;
				// cout << s << endl << s.length() << endl;
			}
			else pc += 1;
		}
	}
}

string r_format(string temp,string s,ll pc, ll idx){
	idx++;
	// cout << temp << ' ' << s << ' ' << pc << ' ' << idx << endl;
	ll comma_idx = idx;
	string opcode, reg1,reg2,shamt,fncode;
	if(s=="shll" || s == "shrl" || s == "shra"){
		opcode = bitset<5>(13).to_string();
		while(temp[comma_idx]!=','){
			comma_idx++;
		}
		
		assert(reg_map.find(temp.substr(idx,comma_idx-idx))!=reg_map.end());
		reg1 = reg_map[temp.substr(idx,comma_idx-idx)];
		reg2 = "00000";
		shamt = bitset<12>(stoi(temp.substr(comma_idx+1))).to_string();
		int x = 0;
		if(s == "shll")x = 0;
		else if(s=="shrl")x = 1;
		else x = 2;

		fncode = bitset<5>(x).to_string();
	}
	else{
		opcode = bitset<5>(0).to_string();
		while(temp[comma_idx]!=','){
			comma_idx++;
		}
		// cout << temp.substr(idx,comma_idx-idx) << endl;
		assert(reg_map.find(temp.substr(idx,comma_idx-idx))!=reg_map.end());
		reg1 = reg_map[temp.substr(idx,comma_idx-idx)];
		// cout << temp.substr(comma_idx+1) << endl;
		assert(reg_map.find(temp.substr(comma_idx+1))!=reg_map.end());
		reg2 = reg_map[temp.substr(comma_idx+1)];
		shamt = bitset<12>(0).to_string();
		int x = 0;
		if(s=="add")x=0;
		else if(s=="comp")x=1;
		else if(s=="shllv")x=2;
		else if(s=="shrlv")x=3;
		else if(s=="shrav")x=4;
		else if(s=="diff")x=5;
		else if(s=="and")x=6;
		else if(s=="xor")x=7;
		fncode = bitset<5>(x).to_string();
	}
	return opcode+reg1+reg2+shamt+fncode;
}

string i_format(string temp,string s,ll pc, ll idx){
	idx++;
	ll comma_idx = idx;
	string opcode, reg1,reg2,imm;
	while(temp[comma_idx]!=','){
		comma_idx++;
	}
	if(s=="addi" || s=="compi"){
		assert(reg_map.find(temp.substr(idx,comma_idx-idx))!=reg_map.end());
		reg1 = reg_map[temp.substr(idx,comma_idx-idx)];
		reg2 = "00000"; 
		imm  = bitset<17>(stoi(temp.substr(comma_idx+1))).to_string();
		// cout << imm << endl;
		if(s=="addi")opcode = bitset<5>(1).to_string();
		else opcode = bitset<5>(2).to_string();
	}
	else{
		if(s=="lw")opcode = bitset<5>(5).to_string();
		else if(s=="sw")opcode = bitset<5>(6).to_string();
		assert(reg_map.find(temp.substr(idx,comma_idx-idx))!=reg_map.end());
		reg2 = reg_map[temp.substr(idx,comma_idx-idx)];
		ll bracket_idx_open = comma_idx,bracket_idx_close=comma_idx;
		while(temp[bracket_idx_open]!='(')bracket_idx_open++;
		while(temp[bracket_idx_close]!=')')bracket_idx_close++;
		assert(reg_map.find(temp.substr(bracket_idx_open+1,bracket_idx_close-bracket_idx_open-1))!=reg_map.end());
		reg1 = reg_map[temp.substr(bracket_idx_open+1,bracket_idx_close-bracket_idx_open-1)];
		// cout << reg2 << endl;
		imm  = bitset<17>(stoi(temp.substr(comma_idx+1,bracket_idx_open-1-comma_idx))).to_string();
	}
	return opcode+reg1+reg2+imm;
}

string b_format(string temp,string s,ll pc, ll idx){
	string opcode,reg, branch_addr, fncode;
	opcode = bitset<5>(7).to_string();
	idx++;
	int x = 0;
	if(s=="br")x=0;
	else if(s=="bltz")x=1;
	else if(s=="bz")x=2;
	else x=3;
	fncode = bitset<5>(x).to_string();
	if(s=="br"){
		string x = temp.substr(idx);
		assert(reg_map.find(x) != reg_map.end());
		reg = reg_map[x];
		branch_addr = bitset<17>(0).to_string();
	}
	else{
		ll comma_idx = idx;
		string opcode,reg1,reg2,imm;
		while(temp[comma_idx] != ','){
			comma_idx++;
		}
		string str = temp.substr(idx,comma_idx-idx);
		// cout << str << endl;
		assert(reg_map.find(str) != reg_map.end());
		reg = reg_map[str];
		string label = temp.substr(comma_idx+1);
		assert(mp_label.find(label)!=mp_label.end());
		branch_addr = bitset<17>(mp_label[label]-pc-1).to_string();
	}
	return opcode+reg+branch_addr+fncode;
}

string j_format(string temp,string s,ll pc, ll idx){
	string opcode, addr;
	idx++;
	int x = 0;
	if(s=="b")x=8;
	else if(s=="bl")x=9;
	else if(s=="bcy")x=10;
	else if(s=="bncy")x=11;
	opcode = bitset<5>(x).to_string();
	string label = temp.substr(idx);
	// cout << label << endl;
	assert(mp_label.find(label)!=mp_label.end());
	addr = bitset<27>(mp_label[label]).to_string();
	return opcode+addr;
}

void generate_binary(string ip_file,string op_file){
	ifstream file(ip_file);
	ll pc = 5;
	string temp;
	while(getline(file,temp)){
		
		if((temp[0] >= 'a' && temp[0] <= 'z') || (temp[0] >= 'A' && temp[0] <= 'Z')){
			// temp.back() = '\0';
			auto it = give_first_word(temp);
			string &s = it.first;
			
			if(temp[it.second+1] == ':')continue;
			assert(temp[it.second+1] == ' ');
			if(format_map.find(s) == format_map.end()){
				// cout << "Err108" << endl;
				return;
 			}
			string f = format_map[s];
			string curr_binary = "";
			if(f=="R")curr_binary = r_format(temp,s,pc,it.second+1);
			else if(f=="I")curr_binary = i_format(temp,s,pc,it.second+1);
			else if(f=="B")curr_binary = b_format(temp,s,pc,it.second+1);
			else{
				curr_binary = j_format(temp,s,pc,it.second+1);
				assert(f=="J"); //check
			}

			// ofstream ofile(op_file,ios::app);
			cout << curr_binary;
			cout << ",\n";
			pc ++;
		}
	}
}

int main(){
	build_reg_map();
	build_format_map();
	//string filename = "test.s";
	string filename;
	// string outfile;
	cin >> filename;
	// ofstream ofile;

	cout << "memory_initialization_radix=2;\n" << "memory_initialization_vector=\n";
	for(int i=0;i<5;i++)cout << "00000000000000000000000000000000,\n";
	process_labels(filename);
	generate_binary(filename,"");
	cout << "00000000000000000000000000000000;\n";
	return 0;
}
