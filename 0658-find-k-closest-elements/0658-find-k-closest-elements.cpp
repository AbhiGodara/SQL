class Solution {
public:
    vector<int> findClosestElements(vector<int>& arr, int k, int x) {
        vector<int> result;
        int n=arr.size();
        if(x<arr[0]){
            for(int i=0 ; i<k ; i++){
                result.push_back(arr[i]);
            }
            return result;
        }
        else if(x>arr[n-1]){
            for(int i=n-k ; i<n ; i++){
                result.push_back(arr[i]);
            }
            return result;
        }
        else{
            int y=0;
            for(int i=0 ; i<n ; i++){
                if(arr[i]==x){
                    y=i;
                    break;
                }
                if(abs(arr[i]-x)<abs(arr[y]-x)) y=i;
            }
            result.push_back(arr[y]);
            int z=result.size();
            int i=1;
            int j=1;
            while(z!=k){
                if(y-i>=0 && y+j<n){
                    if(abs(arr[y-i]-x)<=abs(arr[y+j]-x)){
                        result.push_back(arr[y-i]);
                        i++;
                    }
                    else{
                        result.push_back(arr[y+j]);
                        j++;
                    }
                }
                else if(y-i<0){
                    result.push_back(arr[y+j]);
                    j++;
                }
                else{
                    result.push_back(arr[y-i]);
                    i++;
                }
                z=result.size();
            }
        }
        sort(result.begin(), result.end());
        return result;
    }
};