function [vystup] = mfiltr(vstup, typ, delkaokna)
    vystup = zeros(length(vstup),1);
    % Ensure the window length is odd for symmetric windowing

    for i = (delkaokna+1)/2:length(vstup)-(delkaokna+1)/2
        vstup_cast=vstup(i=((delkaokna-1)/2)+1:i+((delkaokna-1)/2));
        if strcmp(typ, 'median')
            vystup(i) = median(vstup_cast);
        elseif strcmp(typ, 'mean')
            vystup(i) = mean(vstup_cast);
        else
            error('Invalid filter type. Use either "median" or "mean".');
        end
    end
end
