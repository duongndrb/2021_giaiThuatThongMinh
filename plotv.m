function  plotv(x, varargin)
% Plot the robot pose
%
% If X (Nx3) is a matrix it is considered to represent a trajectory in which case
% the Unicycle graphic is animated.
%
% Options::
% 'scale',S    Draw Unicycle with length S x maximum axis dimension
% 'fps',F      Frames per second in animation mode (default 10)
% 'x0'        initial position
% 'mode'   1:animation 2:plot

opt.x0 = zeros(3,1);
opt.scale = 1/40;
opt.fps = 10;
opt.mode=1;
opt.goal = zeros(3,1);

[opt,args] = tb_optparse(opt, varargin);

xmin = min(opt.x0(1),opt.goal(1))-10;
xmax = max(opt.x0(1),opt.goal(1))+10;
ymin = min(opt.x0(2),opt.goal(2))-10;
ymax = max(opt.x0(2),opt.goal(2))+10;

     
          
 %% animate the unicycle
 if opt.mode==1
     
        axis([xmin xmax ymin ymax]); 
        a = axis;
        d = (a(2)+a(4) - a(1)-a(3)) * opt.scale;
        axis('square');
        ax=gca;
        grid on
       
        h = hgtransform();
        hp = drawrobot([0 0 0],'k',2,d,d);
        for hh=hp
            set(hh, 'Parent', h);
        end
        %animate the path
        robotposition = animatedline('color','k',...
        'linestyle','-',...
        'Parent',ax);
          %determine the stop condition
           j=1;
            while(j<=numrows(x)-1)
                j=j+1;
            end
            for i=1:j
                T = transl([x(i,1:2) 0]) * trotz( x(i,3) );
                set(h, 'Matrix', T);
                 addpoints(robotposition,x(i,1),x(i,2));
                drawnow;
            end
 else
 %% plot trajectory history           
 %         figure
          hold on;
          axis([xmin xmax ymin ymax]);  
          a = axis;
          d = (a(2)+a(4) - a(1)-a(3)) * opt.scale;
          axis('square');
          grid on;
        
       
          index=zeros(5,1);
          index(1,1)=1;
          index(5,1)=numrows(x);
          % Determining the positions to draw the robot
          totalDis = norm([opt.goal(1)-opt.x0(1),opt.goal(2)-opt.x0(2)],2);
          for i=1:numrows(x)
              currentDis = norm([x(i,1)-opt.x0(1),x(i,2)-opt.x0(2)],2);
              if (currentDis<=3/4*totalDis)
                  index(2,1)=i;
              end
              if (currentDis<=2/4*totalDis)
                    index(3,1)=i;
              end
              if (currentDis<=1/4*totalDis)
                    index(4,1)=i;
              end  
          end
              
           for  j=1:1:length(index)
               i=index(j,1);
            drawrobot([x(i,1),x(i,2),x(i,3)],'k',2,d,d);
           end
           hold on
           plot(x(:,1),x(:,2),'k-');
 end
         
end

   