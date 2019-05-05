
P = [ 0 1 ;1 0]

t_all = [];
i_all = [];
figure(1)
clf
for i = 1:100
    t = P^i
    t_all = [t_all t(:)];
    i_all = [i_all  ones(4,1)*i];
    subplot(211)
    draw_states(t,i)
    subplot(212)
    plot(i_all',t_all','.-')
    xlabel('discrete time steps')
    ylabel('probability')
    title('evolution of transition probs. for each element')
    pause
end
