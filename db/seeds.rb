Admin::Admin.create([{ name: 'Sugi', email: 'admin@gmail.com', password: '123456' },
                     { name: 'Sagi', email: 'chinzorigt_saruulgun@unimedia.co.jp', password: 'abc123' }])

Worker::Worker.create([{ name: 'Worker1', email: 'user@gmail.com', password: '123456' },
                       { name: 'Worker2', email: 'example@gmail.com', password: '123456' },
                       { name: 'Sugi', email: 'admin@gmail.com', password: '123456' },
                       { name: 'Sagi', email: 'admin@unimedia.co.jp', password: 'abc123' }])

Worker::Worker.create([{ name: 'Worker1', email: 'user@gmail.com', password: '123456' },
                       { name: 'Worker2', email: 'example@gmail.com', password: '123456' },
                       { name: 'Sugi', email: 'admin@gmail.com', password: '123456' },
                       { name: 'Sagi', email: 'admin@unimedia.co.jp', password: 'abc123' }])

Worker::Shipment.create([{ code: 's123', name: 'good1', note: 'big', delivery_date: DateTime.now },
                         { code: 's234', name: 'good2', note: 'small', delivery_date: DateTime.now },
                         { code: 's123', name: 'good3', note: 'urgent!', delivery_date: DateTime.now },
                         { code: 's234', name: 'good4', note: '', delivery_date: DateTime.now }])