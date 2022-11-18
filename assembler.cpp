#include <iostream>
#include <string>

using namespace std;
// typedef long long ll;
// ifstream read;
void hexatobcd(string s)
{
    if (s == "0")
        cout << "0000";
    else if (s == "1")
        cout << "0001";
    else if (s == "2")
        cout << "0010";
    else if (s == "3")
        cout << "0011";
    else if (s == "4")
        cout << "0100";
    else if (s == "5")
        cout << "0101";
    else if (s == "6")
        cout << "0110";
    else if (s == "7")
        cout << "0111";
    else if (s == "8")
        cout << "1000";
    else if (s == "9")
        cout << "1001";
    else if (s == "A")
        cout << "1010";
    else if (s == "B")
        cout << "1011";
    else if (s == "C")
        cout << "1100";
    else if (s == "D")
        cout << "1101";
    else if (s == "E")
        cout << "1110";
    else if (s == "F")
        cout << "1111";
}

void hexatobcdreg(string s)
{
    if (s == "0")
        cout << "00";
    else if (s == "1")
        cout << "01";
    else if (s == "2")
        cout << "10";
    else if (s == "3")
        cout << "0011";
}

void alphabet(string reg)
{
    if (reg == "A")
        cout << "00";
    if (reg == "B")
        cout << "01";
    if (reg == "C")
        cout << "10";
    if (reg == "D")
        cout << "11";
}

int main()
{
    // read.open("C:\newfolder\tb.txt");

    freopen("input.txt", "r", stdin);
    freopen("tb_processor.v", "w+", stdout);

    
        cout << "`timescale 1ns/1ps\n";       
        cout << "module tb_cpu;\n"  ;
        cout << "reg clk,reset, ins_write, ins_read;\n";
        cout << "reg[7:0] machine_code;\n";
        cout << "wire[7:0] alu_result, flag, instruction_out, pc;\n";
        cout << "\n";
        cout << "  CPU C(.clk(clk), .reset(reset), .alu_result(alu_result), .flag(flag), .instruction_write_data(machine_code),\n";
        cout << "         .instruction(instruction_out), .pc(pc), .ins_write(ins_write), .ins_read(ins_read));\n";
        cout << "initial     \n";
        cout << " begin\n";
        cout << "  $dumpfile(\"dump.vcd\");    \n";
        cout << "  $dumpvars(1,tb_cpu);   \n";
        cout << "end                      \n";
        cout << "\n";
        cout << "initial   \n";
        cout << " begin\n";
        cout << "  clk = 0; ins_write=1;\n";
        cout << "forever\n";
        cout << "    begin\n";
        cout << "     #1 clk = 0;\n";
        cout << "     #1 clk = 1;\n";
        cout << "    end\n";
        cout << " end  \n";
        cout << "\n";
        cout << "\n";
        cout << "initial \n";
        cout << "begin \n";
        cout << "    #1\n";

    string s;
    while (getline(cin, s))
    {

        // string s;
        // getline(cin, s);
        // cout << s << endl;
        cout << "\t";
        string opcode;
        for (int i = 0; i < s.size(); i++)
        {
            if (s[i] == ' ')
                break;
            else
                opcode += s[i];
        }
        // operand(opcode);
        cout << "#2 machine_code = 8'b";
        if (opcode == "LD")
        {
            cout << "0000";
            string al = s.substr(3, 1);
            hexatobcd(al);
            // cout << endl;
        }

        else if (opcode == "ST")
        {
            cout << "0001";
            string al = s.substr(3, 1);
            hexatobcd(al);
            // cout << endl;
        }

        else if (opcode == "MR")
        {
            cout << "0011";
            alphabet(s.substr(3, 1));
            alphabet(s.substr(5, 1));
            // cout << endl;
        }

        else if (opcode == "MI")
        {
            cout << "0010";
            string pb = s.substr(3, 1);
            hexatobcdreg(pb);
            string al = s.substr(5, 1);
            hexatobcd(al);
            // cout << endl;
        }

        else if (opcode == "SUM")
        {
            cout << "0100";
            alphabet(s.substr(4, 1));
            alphabet(s.substr(6, 1));
            // cout << endl;
        }

        else if (opcode == "SMI")
        {
            cout << "1100";
            string pb = s.substr(4, 1);
            hexatobcdreg(pb);
            string al = s.substr(6, 1);
            hexatobcd(al);
            // cout << endl;
        }

        else if (opcode == "SB")
        {
            cout << "0101";
            alphabet(s.substr(3, 1));
            alphabet(s.substr(5, 1));
            // cout << endl;
        }

        else if (opcode == "SBI")
        {
            cout << "1101";
            string pb = s.substr(4, 1);
            hexatobcdreg(pb);
            string al = s.substr(6, 1);
            hexatobcd(al);
            // cout << endl;
        }

        else if (opcode == "CM")
        {
            cout << "0111";
            alphabet(s.substr(3, 1));
            alphabet(s.substr(5, 1));
            // cout << endl;
        }

        else if (opcode == "CMI")
        {
            cout << "1111";
            string pb = s.substr(4, 1);
            hexatobcdreg(pb);
            string al = s.substr(6, 1);
            hexatobcd(al);
            // cout << endl;
        }
        else if (opcode == "ANR")
        {
            cout << "0110";
            alphabet(s.substr(4, 1));
            alphabet(s.substr(6, 1));
            // cout << endl;
        }

        else if (opcode == "ANI")
        {
            cout << "1110";
            string pb = s.substr(4, 1);
            hexatobcdreg(pb);
            string al = s.substr(6, 1);
            hexatobcd(al);
            // cout << endl;
        }

        else if (opcode == "ORR")
        {
            cout << "1000";
            alphabet(s.substr(4, 1));
            alphabet(s.substr(6, 1));
            // cout << endl;
        }

        else if (opcode == "ORI")
        {
            cout << "1001";
            string pb = s.substr(4, 1);
            hexatobcdreg(pb);
            string al = s.substr(6, 1);
            hexatobcd(al);
            // cout << endl;
        }

        else if (opcode == "XRR")
        {
            cout << "1010";
            alphabet(s.substr(4, 1));
            alphabet(s.substr(6, 1));
            // cout << endl;
        }

        else if (opcode == "XRI")
        {
            cout << "1011";
            string pb = s.substr(4, 1);
            hexatobcdreg(pb);
            string al = s.substr(6, 1);
            hexatobcd(al);
            
        }

        cout << ";" << endl;

    }

    cout << "    #2 ins_write = 0; ins_read = 1; reset = 1;\n";
    cout << "    #0.1 reset = 0; \n";
    cout << "end\n";
    cout << "\n";
    cout << "initial \n";
    cout << " begin   \n";
    cout << "   $monitor($time,\" %b %b %b\", pc, instruction_out, alu_result);\n";
    cout << " end\n";
    cout << "  \n";
    cout << "initial #15 $finish;\n";
    cout << "endmodule\n";
}