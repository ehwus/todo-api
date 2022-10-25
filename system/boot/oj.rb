Application.boot(:oj) do
  init do
    require 'oj'
  end

  start do
    Oj.default_options = { mode: :compat }
  end
end
