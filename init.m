function out = init(data, class, label)
  idx = find(label == class);
  out = mean(data(idx));
end
