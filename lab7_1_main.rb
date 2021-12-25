def func(arr,n)
    file_f = File.new('F.txt', 'w')
    n.times do
        arr.each { |num| file_f.print(num.to_s + ' ')}
        arr.each { |num| file_f.print((-num).to_s + ' ')}
    end
    file_f.close
end

def scndf
    pos = []
    neg = []
    file_f = File.new('F.txt', 'r')
    file_f.gets.split.each do |num|
        if num.to_i > 0
            pos << num.to_i
        else
            neg << num.to_i
        end
    end
        file_f.close
        transf = 0
        file_p = File.new('P.txt', 'w')
        9.times do 
            (0..4).each { |ind| file_p.print(pos[transf + ind].to_s + ' ')}
            (0..4).each { |ind| file_p.print(neg[transf + ind].to_s + ' ')}
            transf +=5
        end
        transf = 0
        file_p.print("\n")
        3.times do
         (0..19).each { |ind| file_p.print(pos[transf + ind].to_s + ' ')}
         (0..19).each { |ind| file_p.print(neg[transf + ind].to_s + ' ')}
         transf += 20
        end
    file_p.close
    end
