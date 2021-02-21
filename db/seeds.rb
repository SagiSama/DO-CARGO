Admin::Admin.create([{ name: 'Sugi', email: 'admin@gmail.com', password: '123456' },
                     { name: 'Sagi', email: 'chinzorigt_saruulgun@unimedia.co.jp', password: 'abc123' }])

Worker::Worker.create([{ name: 'Worker1', email: 'user@gmail.com', password: '123456' },
                       { name: 'Worker2', email: 'example@gmail.com', password: '123456' },
                       { name: 'Sugi', email: 'admin@gmail.com', password: '123456' },
                       { name: 'Sagi', email: 'admin@unimedia.co.jp', password: 'abc123' }])

Worker::Shipment.create([{ code: 'SK0001', shipment_definition: 'utas hurgelt sample', shipment_object_description: 'iphone 12 pro max 2 shirheg',
                           about_payment: 'uridchilan tulsun', note: 'hevreg unetei zuil uchir bolgoomtoi hurgeh agaariin teevreer hurgene',
                           delivery_date: '2021-03-01', phone: '99773234', customer_phone: '(976)99773234', recipient_phone: '200-510-254',
                           email: 'example@gmail.com', customer_name: 'Hulk', recipient_name: 'Black widow', location_from: 'Korea Seaul',
                           location_to: 'Ub Mn', status: 3, status_history: 'registered, paid, done', delivered_date: '2021-03-01', price: 15000,
                           created_worker_id: Worker::Worker.first.id, updated_worker_id: Worker::Worker.first.id, created_at: DateTime.now, updated_at: DateTime.now },
                         { shipment_definition: '(sample) automashin hurgelt', shipment_object_description: 'G class',
                           about_payment: 'hurgesnii daraa tulnu', note: 'hevreg unetei zuil uchir bolgoomtoi hurgeh agaariin teevreer hurgene',
                           delivery_date: '2021-03-01', phone: '99773234', customer_phone: '(976)99773234', recipient_phone: '200-510-254',
                           email: 'example@gmail.com', customer_name: 'Customer1', recipient_name: 'Customer2', location_from: 'Korea Seaul',
                           location_to: 'Ub Mn', status: 0, status_history: 'paid', delivered_date: '2021-30-03', price: 15000,
                           created_worker_id: Worker::Worker.first.id, updated_worker_id: Worker::Worker.first.id, created_at: DateTime.now, updated_at: DateTime.now },
                         { shipment_definition: '(sample) motobyke', shipment_object_description: 'kawasaki ninja 2020',
                           about_payment: 'hurgesnii daraa tulnu', note: 'gazraar 1 sariin hugatsaand hurgene',
                           delivery_date: '2021-03-01', phone: '99773234', customer_phone: '(976)99773234', recipient_phone: '200-510-254',
                           email: 'example@gmail.com', customer_name: 'SagiSama', recipient_name: 'SagiSama', location_from: 'Korea Seaul',
                           location_to: 'Ub Mn', status: 0, status_history: 'registered', delivered_date: '2021-01-01', price: 15000,
                           created_worker_id: Worker::Worker.first.id, updated_worker_id: Worker::Worker.first.id, created_at: DateTime.now, updated_at: DateTime.now } ])

Worker::Payment.create([{ shipment_id: Worker::Shipment.first.id, amount_paid: 15000, payment_type: 1, note: 'dansaar tulsun',
                          created_worker_id: Worker::Worker.first.id, updated_worker_id: Worker::Worker.first.id, created_at: DateTime.now, updated_at: DateTime.now }])

