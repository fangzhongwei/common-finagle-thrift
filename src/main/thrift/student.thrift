struct Student{
 1: i32 sno,
 2: string sname,
 3: bool ssex,
 4: i16 sage,
}
service StudentService{
 void put(1: Student s),
 Student get(1: i32 sno),
}