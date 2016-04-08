function spatial_posteriors = build_spatial_posteriors(posteriors_grid, neighborhood_size)

spatial_posteriors = struct();

for i = 1:size(posteriors_grid,1)
    for j = 1:size(posteriors_grid,2)
        
        if ~isempty(posteriors_grid{i,j})
            
            spatial_posteriors(i,j).amps = [];
            spatial_posteriors(i,j).num_events = [];
            spatial_posteriors(i,j).tau1 = [];
            spatial_posteriors(i,j).tau2 = [];
            spatial_posteriors(i,j).times = [];
            
            for ii = -neighborhood_size:neighborhood_size
                for jj = -neighborhood_size:neighborhood_size
                     if ~(i+ii < 1 || i+ii > size(posteriors_grid,1) || j+jj < 1 || j+jj > size(posteriors_grid,2))
                         
                         
                         spatial_posteriors(i,j).amps = [spatial_posteriors(i,j).amps [posteriors_grid{i+ii,j+jj}.amps]];
                         spatial_posteriors(i,j).num_events = [spatial_posteriors(i,j).num_events [posteriors_grid{i+ii,j+jj}.num_events]];
                         spatial_posteriors(i,j).tau1 = [spatial_posteriors(i,j).tau1 [posteriors_grid{i+ii,j+jj}.tau1]];
                         spatial_posteriors(i,j).tau2 = [spatial_posteriors(i,j).tau2 [posteriors_grid{i+ii,j+jj}.tau2]];
                         spatial_posteriors(i,j).times = [spatial_posteriors(i,j).times [posteriors_grid{i+ii,j+jj}.times]];
                         
                     end
                end
            end
            (i-1)*size(posteriors_grid,2) + j + 1
            figure(9991)
            subplot(size(posteriors_grid,1),size(posteriors_grid,2),(i-1)*size(posteriors_grid,2) + j)
            histogram(spatial_posteriors(i,j).amps)
%             axis off
%             ylim([0 2500*9])
            
            figure(9992)
            subplot(size(posteriors_grid,1),size(posteriors_grid,2),(i-1)*size(posteriors_grid,2) + j)
            histogram(spatial_posteriors(i,j).num_events)
%             axis off
%             ylim([0 2500*9])
            
            figure(9993)
            subplot(size(posteriors_grid,1),size(posteriors_grid,2),(i-1)*size(posteriors_grid,2) + j)
            histogram(spatial_posteriors(i,j).tau1)
%             axis off
%             ylim([0 2500*9])
            
            figure(9994)
            subplot(size(posteriors_grid,1),size(posteriors_grid,2),(i-1)*size(posteriors_grid,2) + j)
            histogram(spatial_posteriors(i,j).tau2)
%             axis off
%             ylim([0 2500*9])
            
            figure(9995)
            subplot(size(posteriors_grid,1),size(posteriors_grid,2),(i-1)*size(posteriors_grid,2) + j)
            histogram(spatial_posteriors(i,j).times)
%             axis off
%             ylim([0 2500*9])
            
        end
    end
end

figure(9991)
subplot(size(posteriors_grid,1),size(posteriors_grid,2),1)
title('amps')

figure(9992)
subplot(size(posteriors_grid,1),size(posteriors_grid,2),1)
title('num events')

figure(9993)
subplot(size(posteriors_grid,1),size(posteriors_grid,2),1)
histogram(spatial_posteriors(i,j).tau1)
title('tau on')

figure(9994)
subplot(size(posteriors_grid,1),size(posteriors_grid,2),1)
histogram(spatial_posteriors(i,j).tau2)
title('tau off')

figure(9995)
subplot(size(posteriors_grid,1),size(posteriors_grid,2),1)
histogram(spatial_posteriors(i,j).times)
title('times')
    

    
    