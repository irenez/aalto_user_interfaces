function [classes] = self_organizing_map (data, d)

    net = selforgmap([d d]);
    net = train(net, data);
    
    y = net(x);
    classes = vec2ind(y);

end
