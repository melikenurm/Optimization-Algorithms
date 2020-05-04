function beta = hestenes_stiefel(x_0, x_new, g, d)
    beta = (transpose(g(x_new(1),x_new(2)))*(g(x_new(1),x_new(2))-g(x_0(1),x_0(2))))/(transpose(d)*(g(x_new(1),x_new(2))-g(x_0(1),x_0(2))))
end