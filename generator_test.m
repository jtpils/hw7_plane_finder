clear all;
fileID = fopen('C:\Users\User\Desktop\test\test.txt','w+'); %����� ������ �������� �����, ���� �����
%������� ���������� �����; ����� �����������
a=3;
b=25000;
N = (b-a).*rand + a;
%N=10;
%������� ���������� ������������� ��������� ����� 
pros=N/2+round((N/2-N/2*0.2).*rand)
%������� ����� �� ���
noise=N-pros
%������� ����������
a=0.01;
b=0.5;
p = (b-a).*rand + a ;
fprintf(fileID,'%f\n%d\n', p, N);
%������� ����� ��������� ������
for i=1:3
a=-100;
b=100;
x(i)=(b-a).*rand + a;
y(i)=(b-a).*rand + a;
a=(3).*rand;
b=a+1;
z(i)=(b-a).*rand + a;
fprintf(fileID,'%.2f\t %.2f\t %.2f\t\n', x(i),y(i),z(i));
end
x=x';
y=y';
z=z';
pCloud = pointCloud([x y z]);
model = pcfitplane(pCloud,p);
A = model.Parameters(1,1);
B = model.Parameters(1,2);
C = model.Parameters(1,3);
D = model.Parameters(1,4);
%������� ����� ��������� ������
for i=4:pros
  a=-100;
  b=100;
  x1=(b-a).*rand + a;
  y1=(b-a).*rand + a;  
  a=0.01;
  b=p;
  z1=-(A*x1+B*y1+D)/C+((b-a).*rand + a)*(-1).^round(2.*rand); 
  fprintf(fileID,'%.2f\t %.2f\t %.2f\t\n', x1,y1,z1);
end
%������� ����������
for i=1:noise
  a=-100;
  b=100;
  x1=(b-a).*rand + a;
  y1=(b-a).*rand + a;  
  z1=-(A*x1+B*y1+D)/C+((b-a).*rand + a)*(-1).^round(2.*rand); 
  fprintf(fileID,'%.2f\t %.2f\t %.2f\t\n', x1,y1,z1);
end
fclose(fileID);