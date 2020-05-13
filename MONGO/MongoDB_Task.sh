#1) Знайти всіх дітей в яких сердня оцінка 4.2
db.getCollection('students').find({
    avgScore: 4.2
    });

##2) Знайди всіх дітей з 1 класу
db.getCollection('students').find({
    class: 1
    }).sort({
        avgScore:1
        });

##3) Знайти всіх дітей які вивчають фізику
db.getCollection('students').find({
    lessons: 'physics'
    }).sort({
        avgScore:-1,
        name:1
        });

##4) Знайти всіх дітей, батьки яких працюють в науці ( scientist )
db.getCollection('students').find({
    'parents.profession': 'scientist'
    }).sort({
        name:1
        });

##5) Знайти дітей, в яких середня оцінка більша за 4
db.getCollection('students').find({
    avgScore: {$gt: 4.2}
}).sort({
    avgScore:1
    })

##6) Знайти найкращого учня
db.getCollection('students').find().sort({avgScore:-1,lessons:-1}).limit(1);

db.getCollection('students').find({},{_id:null,name:1,class:1,avgScore:1}).sort({avgScore:-1,lessons:-1}).limit(1)

db.getCollection('students').aggregate([
   {$group:{_id:null,max:{$max: '$avgScore'}}}
]);

##7) Знайти найгіршого учня
db.getCollection('students').find({},{_id:null,name:1,class:1,avgScore:1})
  .sort({avgScore:1,lessons:-1}).limit(1);

##8) Знайти топ 3 учнів
db.getCollection('students').find({},{_id:null,name:1,class:1,avgScore:1})
    .sort({avgScore:-1,lessons:-1}).limit(3);

##9) Знайти середній бал по школі
db.getCollection('students').aggregate([
    {$group:{_id:null,
        AVG:{$avg:'$avgScore'},
        SUM:{$sum:'$avgScore'},
        CUUNT:{$sum:1},
        }}
]);

##10) Знайти середній бал дітей які вивчають математику або фізику
db.getCollection('students').aggregate([
    {$match:{lessons: {$in:['physics','mathematics']}}},
    {$group:{_id:'AVG in physics',
        AVG:{$avg:'$avgScore'},
        SUM:{$sum:'$avgScore'},
        CUUNT:{$sum:1},
        Names:{$push:'$name'}
        }}
    ])

##11) Знайти середній бал по 2 класі
db.getCollection('students').aggregate([
    {$match:{class: 2}},
    {$group:{_id:'AVG in 2nd class',
        AVG:{$avg:'$avgScore'},
        SUM:{$sum:'$avgScore'},
        CUUNT:{$sum:1},
        Names:{$push:'$name'}
        }}
    ]);

##12) Знайти дітей з не повною сімєю
db.getCollection('students').find({
    'parents.1':{$exists:false}
    });

db.students.find({parents:{$size:1}});

##13) Знайти батьків які не працюють
db.students.aggregate([
  {$match:{'parents':{$ne:null}}},
  {$unwind:"$parents"},
  {$match:{'parents.profession':null}},
  {$project:{_id:0,name:"$parents.name"}}
]);

##14) Не працюючих батьків влаштувати офіціантами
db.students.updateMany(
    {parents:{$ne:null},'parents.profession':null},
    {$set:{'parents.$.profession':'waiter'}}
);

##15) Вигнати дітей, які мають середній бал менше ніж 2.5
db.students.remove({
    avgScore:{$lt:2.5}
});

##16) Дітям, батьки яких працюють в освіті ( teacher ) поставити 5
db.students.updateMany(
    {'parents.profession':'teacher'},
    {$set:{avgScore:5}}
);

##17) Знайти дітей які вчаться в початковій школі (до 5 класу) і вивчають фізику ( physics )
db.students.find(
    {class:{$lt:5},
    lessons:'physics'}
  );

##18) Знайти найуспішніший клас
db.students.aggregate([
    {$group:{_id:'$class',
            AVG:{$avg:'$avgScore'}
            }},
    {$sort:{AVG:-1}},
    {$limit:1}
]);