#include <bits/stdc++.h>
using namespace std;
typedef long long ll;

vector<ll> primeNumbersTillN(ll n)
{
    vector<ll> v(n + 1, true);
    v[1] = false, v[0] = false;
    for (ll i = 2; i * i <= n; i++)
    {
        if (v[i])
        {
            for (ll j = i * i; j <= n; j += i)
            {
                v[j] = false;
            }
        }
    }
    vector<ll> ans;
    for (ll i = 0; i <= n; i++)
    {
        if (v[i])
            ans.push_back(i);
    }

    return ans;
}

void alphabet(string reg)
{
    if (reg == "A")
        cout << "00"
             << " ";
    if (reg == "B")
        cout << "01"
             << " ";
    if (reg == "C")
        cout << "10"
             << " ";
    if (reg == "D")
        cout << "11"
             << " ";
}

int main()
{

    freopen("input.txt", "r", stdin);
    freopen("output.txt", "w", stdout);

    string s;
    while (getline(cin, s))
    {

        // string s;
        // getline(cin, s);
        // cout << s << endl;
        string opcode;
        for (int i = 0; i < s.size(); i++)
        {
            if (s[i] == ' ')
                break;
            else
                opcode += s[i];
        }
        // operand(opcode);

        if (opcode == "LD")
        {
            cout << s.substr(3, 8) << endl;
        }

        else if (opcode == "ST")
        {
            cout << s.substr(3, 8) << endl;
        }

        else if (opcode == "MR")
        {
            cout << "0011"
                 << " ";
            alphabet(s.substr(3, 1));
            alphabet(s.substr(5, 1));
            cout << endl;
        }

        else if (opcode == "MI")
        {
            cout << "0010"
                 << " ";
            alphabet(s.substr(3, 1));
            cout << s.substr(5, 8) << endl;
        }

        else if (opcode == "SUM")
        {
            cout << "0100"
                 << " ";
            alphabet(s.substr(4, 1));
            alphabet(s.substr(6, 1));
            cout << endl;
        }

        else if (opcode == "SMI")
        {
            cout << "1100"
                 << " ";
            alphabet(s.substr(4, 1));
            cout << s.substr(6, 8) << endl;
        }

        else if (opcode == "SB")
        {
            cout << "0101"
                 << " ";
            alphabet(s.substr(3, 1));
            alphabet(s.substr(5, 1));
            cout << endl;
        }

        else if (opcode == "SBI")
        {
            cout << "1101"
                 << " ";
            alphabet(s.substr(4, 1));
            cout << s.substr(6, 8) << endl;
        }

        else if (opcode == "CM")
        {
            cout << "0111"
                 << " ";
            alphabet(s.substr(3, 1));
            alphabet(s.substr(5, 1));
            cout << endl;
        }

        else if (opcode == "CMI")
        {
            cout << "1111"
                 << " ";
            alphabet(s.substr(4, 1));
            cout << s.substr(6, 8) << endl;
        }
        else if (opcode == "ANR")
        {
            cout << "0110"
                 << " ";
            alphabet(s.substr(4, 1));
            alphabet(s.substr(6, 1));
            cout << endl;
        }

        else if (opcode == "ANI")
        {
            cout << "1110"
                 << " ";
            alphabet(s.substr(4, 1));
            cout << s.substr(6, 8) << endl;
        }

        else if (opcode == "ORR")
        {
            cout << "1000"
                 << " ";
            alphabet(s.substr(4, 1));
            alphabet(s.substr(6, 1));
            cout << endl;
        }

        else if (opcode == "ORI")
        {
            cout << "1001"
                 << " ";
            alphabet(s.substr(4, 1));
            cout << s.substr(6, 8) << endl;
        }

        else if (opcode == "XRR")
        {
            cout << "1010"
                 << " ";
            alphabet(s.substr(4, 1));
            alphabet(s.substr(6, 1));
            cout << endl;
        }

        else if (opcode == "XRI")
        {
            cout << "1011"
                 << " ";
            alphabet(s.substr(4, 1));
            cout << s.substr(6, 8) << endl;
        }
    }
}