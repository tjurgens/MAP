function LibermanData= LiebermanMOCdata

LibermanData=[
    2	0.2;
2.1	0.19;
2.2	0.18;
2.3	0.18;
2.4	0.16;
2.5	0.15;
2.6	0.15;
2.7	0.15;
2.8	0.12;
2.9	0.12;
3	0.1;
3.1	0.1;
3.2	0.05;
3.3	0.05;
3.4	0;
3.5	-0.1;
3.6	-0.4;
3.7	-1.2;
3.8	-1.6;
3.9	-1.8;
4	-1.85;
4.1	-2;
4.2	-2.05;
4.3	-2.05;
4.4	-2.15;
4.5	-2.2;
4.6	-2.15;
4.7	-2.1;
4.8	-2.15;
4.9	-2.2;
5	-2.1;
5.1	-2.1;
5.2	-2.25;
5.3	-2.1;
5.4	-2.15;
5.5	-2.1;
5.6	-2.15;
5.7	-2.1;
5.8	-2.2;
5.9	-2.05;
6	-2.15;
6.1	-2.05;
6.2	-2;
6.3	-2.2;
6.4	-2.1;
6.5	-2.05;
6.6	-2.05;
6.7	-2.05;
6.8	-2.2;
6.9	-2.1;
7	-2.05;
7.1	-2.05;
7.2	-0.7;
7.3	-0.1;
7.4	0;
7.5	0.1;
7.6	0.2;
7.7	0.35;
7.8	0.2;
7.9	0.15;
8	0.2;
8.1	0.15;
8.2	0.15;
8.3	0.15;
8.4	0.12;
8.5	0.1;
8.6	0.09;
8.7	0.08;
8.8	0.07;
8.9	0.06;
9	0.05;
];
figure(98), subplot(2,1,2), hold on
scalar=-15;
plot(LibermanData(:,1)-2.5,scalar*LibermanData(:,2))

