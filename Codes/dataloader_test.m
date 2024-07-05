function cell = dataloader_test()
p = dir('test');
N = numel(p);
cell = {'Filename','data','Fs','Label'};
index = 2;

for i = 3:numel(p)
    temp_dir = "test\"+p(i).name;
    temp_obj = dir(temp_dir+"\*.wav");
    Nf = numel(temp_obj);
    for j = 1:Nf
        name_temp = temp_obj(j).name;
        [y_temp , Fs_temp] = audioread(temp_dir+"\"+name_temp);
   
        %labeling
        Label_temp = 0;
        if(name_temp(1:4)=='L1')   %bame
            Label_temp = 1;
        elseif (name_temp(1:4)=='L2') %dane
            Label_temp = 2;
        elseif (name_temp(1:7)=='L3')  %pichone
            Label_temp = 3;
        elseif (name_temp(1:6)=='L4')  %shamne
            Label_temp = 4;
        elseif (name_temp(1:5)=='L5')   %thamo
            Label_temp = 5;
        elseif (name_temp(1:5)=='L6')   %thamo
            Label_temp = 6;
        elseif (name_temp(1:5)=='L7')   %thamo
            Label_temp = 7;
        elseif (name_temp(1:5)=='L8')   %thamo
            Label_temp = 8;
        elseif (name_temp(1:5)=='L9')   %thamo
            Label_temp = 9;            
        else Label_temp = 10;
        end
                                    
        cell(index,:) = {temp_obj(j).name, y_temp, Fs_temp, Label_temp};
        index = index+1;
   end
end

end