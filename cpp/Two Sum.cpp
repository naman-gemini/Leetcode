//Here we need another array (sorted) and have to preserve previous array so as to find indexes in original data set
//Look for the approach using maps or hashes


class Solution
{
public:
    int search(int x,vector<int> &y)
    {
        for(int i=0;i<y.size();i++)
        {
            if(y[i]==x) return (i+1);
        }
    }

    vector<int> search2(int x,vector<int> &y)
    {
        vector<int> p;
        for(int i=0;i<y.size();i++)
        {
            if(y[i]==x)
            {
                p.push_back(i+1);
                break;
            }
        }

        for(int i=y.size()-1;i>=0;i--)
        {
            if(y[i]==x)
            {
                p.push_back(i+1);
                break;
            }
        }
        return p;
    }
    vector<int> twoSum(vector<int> &numbers, int target)
    {
        vector<int> ans;
        vector<int> num(numbers);
        sort(num.begin(),num.end());
        for(int i=0;i<num.size();i++)
        {
            if(binary_search(num.begin(),num.end(),target-num[i]))
            {
                if(num[i]==target-num[i]) ans=search2(num[i],numbers);
                else
                {
                    ans.push_back(search(num[i],numbers));
                    ans.push_back(search(target-num[i],numbers));
                }
                sort(ans.begin(),ans.end());
                return ans;
            }
        }
    }
};
