class Solution {
public:
    vector<int> productExceptSelf(vector<int>& nums) {
        int n=nums.size();
        vector<int> prefix;
        vector<int> suffix;
        prefix.push_back(1);
        suffix.push_back(1);
        for(int i=0 ; i<n-1 ; i++){
            prefix.push_back(prefix.back()*nums[i]);
        }
        for(int i=n-1 ; i>0 ; i--){
            suffix.push_back(suffix.back()*nums[i]);
        }
        reverse(suffix.begin(), suffix.end());
        for(int i=0 ; i<n ; i++){
            prefix[i]=prefix[i]*suffix[i];
        }
        return prefix;
    }
};