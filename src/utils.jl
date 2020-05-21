include("core_simple.jl")
function Base.print(x::Variable,debug=false)
    print("Variable(")
    print("data:",x.data)
    if debug
        println()
        (x.grad !== nothing) && println("grad:",x.grad)
        (x.creator !== nothing) && println("creator:",x.creator.name)
    end
    println(")")
end

function Base.print(f::Func)
    println("Func[")
    print("input: ")
    println(f.input)
    print("output: ")
    println(f.output)
    println("]")
end


function numerical_diff(f::Function, x::Real, e=10e-4)
    return (f(x + e) - f(x - e)) / 2e
end