import Cocoa


protocol Exercise: CustomStringConvertible {
    var name : String { get }
    var caloriesBurned : Double { get }
    var minutes : Double { get }
    
}

extension Exercise {
    var description : String {
        return "\(name) -- \(caloriesBurned) -- \(minutes)"
    }
}

struct EllipticalWorkout : Exercise {
    let name = "Elliptical Workout"
    let caloriesBurned : Double
    let minutes: Double
    let title: String = "Second title test"
    
}

let elliptical = EllipticalWorkout(caloriesBurned: 335, minutes: 30)

struct TrademillWorkout : Exercise {
    let name = "Trademill Workout"
    let caloriesBurned : Double
    let minutes: Double
    let laps: Double
    
}

let trademill = TrademillWorkout(caloriesBurned: 350, minutes: 25, laps: 10.5)

extension Exercise {
    var carloriesBurnedPerMinutes : Double {
        return caloriesBurned / minutes
    }
}

elliptical.carloriesBurnedPerMinutes
trademill.carloriesBurnedPerMinutes

///带where子句的协议扩展

extension Sequence where Iterator.Element == Exercise {
    func totleCarloriesBurned() -> Double {
        var total: Double = 0
        for exercise in self {
            total += exercise.caloriesBurned
        }
        return total
    }
}

let mondayWorkout: [Exercise] = [elliptical, trademill]
mondayWorkout.totleCarloriesBurned()



//覆盖协议默认实现

extension TrademillWorkout {
    var description : String {
        return "trademill extension -- \(caloriesBurned) -- \(laps)  -- \(minutes)"
    }
}

print(elliptical)
print(trademill)

//关于命名 -- 一个警示故事

extension Exercise {
    var title : String {
        return "first title test"
    }
}

for exercise in mondayWorkout {
    print(exercise.title)
}

elliptical.title
trademill.title
