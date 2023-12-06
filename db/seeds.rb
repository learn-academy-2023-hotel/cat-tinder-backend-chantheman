dogs = [
    {
        name: 'NOLA',
        age: '4',
        enjoys: 'sleeping,walks,treats',
        image: 'https://images.unsplash.com/photo-1612774412771-005ed8e861d2?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D' 
    },

    {
        name: 'Ziggy',
        age: '5',
        enjoys: 'sleeping & eating',
        image: 'https://cdn-images.vetstreet.com/d7/eb/08f952a343e2b5065b34a07387c4/AP-YN3MYP-ph645080113.jpg'
    },

    {
        name: 'Oscar',
        age: '5',
        enjoys: 'chew toys,walks,treats',
        image: 'https://plus.unsplash.com/premium_photo-1701006172903-94fe6138242d?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    },
    
    {
        name: 'Zues',
        age: '6',
        enjoys: 'sleeping,walks,dog parks',
        image: 'https://images.unsplash.com/photo-1576434795764-7e27901b7af3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxMTc3M3wwfDF8c2VhcmNofDEzfHxwaXRidWxsfGVufDB8fHx8MTY3NTcxMTI3Mw&ixlib=rb-4.0.3&q=80&w=2000'
    }

]

dogs.each do |each_dog|
    Dog.create each_dog
    puts "creating dog #{each_dog}"
end