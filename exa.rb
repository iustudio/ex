#Written by Ruby
%w{zero one two three four five six seven eight nine }.each_with_index do |num, index|
  define_method num do |arg = nil|
    if arg
      arg.call(index)
    else
      index
    end
  end
end
{ plus: "+", minus: "-", times: "*", divided_by: "/" }.each do |k, v|
  instance_eval <<-RUBY
    def #{k}(inner)
      ->(outer) { outer #{v} inner#{ ".to_f" if k == :divided_by } }
    end
  RUBY
end
