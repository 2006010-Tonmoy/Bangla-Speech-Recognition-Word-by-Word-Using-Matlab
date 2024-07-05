function cell = dataloader_validation()
p = dir('validation');
N = numel(p);
cell = {'Filename','data','Fs','Label'};
index = 2;

for i = 3:numel(p)
    temp_dir = "validation\"+p(i).name;
    temp_obj = dir(temp_dir+"\*.wav");
    Nf = numel(temp_obj);
    for j = 1:Nf
        name_temp = temp_obj(j).name;
        [y_temp  Fs_temp] = audioread(temp_dir+"\"+name_temp);
   
        %labeling
        Label_temp = 0;
        if(name_temp(1:10)=='Bangladesh')   %4
            Label_temp = 1;
        elseif (name_temp(1:10)=='Prokoushol')  %4
            Label_temp = 2;
        elseif (name_temp(1:14)=='Bisshobiddaloy')   %7
            Label_temp = 3;
        elseif (name_temp(1:4)=='BUET')   %6
            Label_temp = 4;
        elseif (name_temp(1:9)=='Cafeteria')   %5
            Label_temp = 5;
        elseif (name_temp(1:4)=='Hall')   %thamo
            Label_temp = 6;
        elseif (name_temp(1:13)=='Sher-e-Bangla')   %thamo
            Label_temp = 7;
        elseif (name_temp(1:6)=='Rashid')   %thamo
            Label_temp = 8;
        elseif (name_temp(1:6)=='Nazrul')   %thamo
            Label_temp = 9;            
        else Label_temp = 10;       
        end
                                    
        cell(index,:) = {temp_obj(j).name, y_temp, Fs_temp, Label_temp};
        index = index+1;
   end
end

end