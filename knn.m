datatrain = xlsread('Dataset Tugas 3 AI 1718.xlsx','DataTrain','B2:F3001');
datavalid = xlsread('Dataset Tugas 3 AI 1718.xlsx','DataTrain','B3002:F4001');
datatest = xlsread('Dataset Tugas 3 AI 1718.xlsx','DataTest');
countbenar = 0;
for i = 1 : 1000
    for j = 1 : 3000
        x1=datavalid(i,1);
        y1=datatrain(j,1);
        x2=datavalid(i,2);
        y2=datatrain(j,2);
        x3=datavalid(i,3);
        y3=datatrain(j,3);
        x4=datavalid(i,4);
        y4=datatrain(j,4);
        e(j,1)=sqrt(((x1-y1)*(x1-y1))+((x2-y2)*(x2-y2))+((x3-y3)*(x3-y3))+((x4-y4)*(x4-y4)));
        e(j,2)=datatrain(j,5);
    end
    count0 = 0;
    count1 = 0;
    durut = sortrows(e,1);
    for k = 1 : 47
        if  durut(k,2)==0
            count0 = count0 + 1;
        else
            count1 = count1 + 1;
        end
    end
    if count0>count1
        hasil(i)=0;
    else
        hasil(i)=1;
    end
end

for i=1 : 1000
    if hasil(i)==datavalid(i,5)
        countbenar=countbenar+1;
    end
end
akurasi=(countbenar/1000)*100;

%hitung datatesting
datatrain_sebenarnya = xlsread('Dataset Tugas 3 AI 1718.xlsx','DataTrain');
for i = 1 : 1000
    for j = 1 : 4000
        x1=datatest(i,1);
        y1=datatrain_sebenarnya(j,1);
        x2=datatest(i,2);
        y2=datatrain_sebenarnya(j,2);
        x3=datatest(i,3);
        y3=datatrain_sebenarnya(j,3);
        x4=datatest(i,4);
        y4=datatrain_sebenarnya(j,4);
        e(j,1)=sqrt(((x1-y1)*(x1-y1))+((x2-y2)*(x2-y2))+((x3-y3)*(x3-y3))+((x4-y4)*(x4-y4)));
        e(j,2)=datatrain_sebenarnya(j,5);
    end
    count0 = 0;
    count1 = 0;
    durut = sortrows(e,1);
    for k = 1 : 47
        if  durut(k,2)==0
            count0 = count0 + 1;
        else
            count1 = count1 + 1;
        end
    end
    if count0>count1
        hasilsebenarnya(i)=0;
    else
        hasilsebenarnya(i)=1;
    end
end

disp(akurasi);
xlswrite('JawabanTest.xlsx',hasilsebenarnya','F2:F1001');