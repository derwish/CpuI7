# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Product.create(title: 'Intel Core i7-2820QM Processor 2.3 GHz 8M Cache SR012',
  description: 
    %{<p>
        With faster, intelligent, multi-core technology that applies processing 
        power where it's needed most, Intel Core i7 processors deliver an 
        incredible breakthrough in PC performance. They are the best
        desktop processors on the planet. You'll multitask applications 
        faster and unleash incredible digital media creation.
        And you'll experience maximum performance for everything you do.
      </p>},
  image_url: '2820.JPG',    
  price: 153.00)
# . . .
Product.create(title: 'Intel Core i5 Mobile i5-2520M SR048 2.5GHz 3MB Socket G2 CPU Processor Laptop',
  description:
    %{<p>
        With intelligent performance that accelerates in response to demanding tasks, such as playing games and editing photos, the Intel Core i5 processor moves faster when you do. The Intel Core i5 processor automatically allocates processing power where it's needed most. Whether you're creating HD video, composing digital music, editing photos, or playing the coolest PC games - with the Intel Core i5 processor you can multitask with ease and be more productive than ever.
      </p>},
  image_url: '2520.PNG',
  price: 34.95)
# . . .

Product.create(title: 'Intel Core i7-2600 3.4 GHz Quad-Core (CM8062300834302) Processor',
  description: 
    %{<p>
        The Intel i7 2600 Processor is specifically for digital video making with its many graphics enhancements. This Intel Quad-Core Processor boasts a clock speed of 3.4 GHz with a turbo max speed of 3.8 GHz. There are three cache components in this quad-core processor. The first accepts up to 256 KB in memory, the second accepts up to 1 MB in memory, and the third can accept up to 8 MB in memory. This particular Intel Quad-Core Processor has a DMI speed of 5.0 GT/s. There are many upgrades and extensions implemented into the Intel i7 2600 Processor. Some of these enhanced features include AES New Instruction, Flex Memory Access, Fast Memory Access, and Hyper-Threading Technology. Along with these enhancements, this quad-core processor has a graphics base frequency of 850 MHz and graphics max dynamic frequency of 1.35 GHz. Other key elements added to this Intel Quad-Core Processor include HD Graphics, Integrated Graphics, Turbo Boost, Clear Video HD, Quick Sync Video, Intel FDI, and Intru 3D technology. The many enhancements included in this processor allow for multitasking without a pause.
      </p>},
  image_url: '2600.PNG',
  price: 177.95)