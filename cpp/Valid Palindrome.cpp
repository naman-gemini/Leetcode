class Solution
{
public:
    bool isPalindrome(string s)
    {
        vector<char> v;
        int len=s.size();
        for(int i=0;i<len;i++)
        {
            if(isalnum(s[i]))
            v.push_back(s[i]);
        }
        len=v.size();
        for(int i=0,j=len-1;i<len;i++,j--)
        {
            if(tolower(v[i])!=tolower(v[j]))
            return false;
        }
        return true;
    }
};
