function out = language_model(in)

if ~exist('ugrams')  | ~exist('bgrams') | ~exist('tgrams')
    load lmdata
end
in = upper(in);
if length(in) > 3
    in = in(1:3);
end
if length(in) == 1
    i = getInd(in);
    if i == -1
        out = 0;
    else
        out = ugrams(i);
    end
elseif length(in) == 2
    i1 = getInd(in(1));
    i2 = getInd(in(2));
    if i1 == -1 || i2 == -1
        out = 0;
    else
        out = bgrams(i1,i2);
    end
else
    i1 = getInd(in(1));
    i2 = getInd(in(2));
    i3 = getInd(in(3));
    if i1 == -1 || i2 == -1 || i3 == -1
        out = 0;
    else
        out = tgrams(i1,i2,i3);
    end
end
end

function i = getInd(c)
i = 1 + int8(c)-int8('A');
if i < 1 || i > 26
    i = -1;
end
end