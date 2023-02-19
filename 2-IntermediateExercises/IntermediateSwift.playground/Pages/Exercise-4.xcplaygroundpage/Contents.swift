import Foundation

/*
 Ejercicio 4:
 Vamos a crear un colegio donde crearemos la estructura de datos
 necesarios usando structs en vez de clases.
 - Struct para los Profesores, con nombre y edad.
 - Struct para las Asignaturas, con nombre de asignatura y cursos donde
 se imparte.
 - Struct para los Alumnos, con nombre, edad y curso.
 - Struct para los Cursos con el tutor (profesor) y los alumnos.
 - Struct del Colegio con los distintos cursos del mismo.
 Queremos poder extraer listados y/o conteo de las asignaturas que
 imparte cada profesor, cuántos alumnos tiene cada uno y cuántos alumnos
 distintos hay en el colegio que al menos estén en una asignatura.
 Para probar que funciona crea una serie de datos de prueba.
 */

struct Profesor {
    let id: Int
    let nombre: String
    let edad: Int
}

struct Asignatura {
    let id: Int
    let nombreAsignatura: String
    let curso: Curso

    func getProfesor() {
        self.curso.tutor
    }

    func getAlumnos() {
        self.curso.alumnos
    }
}

struct Curso {
    let id: Int
    let tutor: Profesor
    var alumnos: [Alumno] = []

    mutating func anadirAlumno(alumno: Alumno) {
        self.alumnos.append(alumno)
    }
}

struct Alumno {
    let id: Int
    let nombre: String
    let edad: Int
    let curso: Curso
}

struct Colegio {
    let id: Int
    var cursos: [Curso]
}

let profesor1 = Profesor(id: 1, nombre: "profe1", edad: 30)
let profesor2 = Profesor(id: 2, nombre: "profe2", edad: 30)
let profesor3 = Profesor(id: 3, nombre: "profe3", edad: 30)
let profesor4 = Profesor(id: 4, nombre: "profe4", edad: 30)

var curso1 = Curso(id: 1, tutor: profesor1)
var curso2 = Curso(id: 2, tutor: profesor2)
var curso3 = Curso(id: 3, tutor: profesor2)
var curso4 = Curso(id: 4, tutor: profesor3)
var curso5 = Curso(id: 5, tutor: profesor3)

let alumno1 = Alumno(id: 1, nombre: "alumno1", edad: 18, curso: curso1)
let alumno2 = Alumno(id: 2, nombre: "alumno2", edad: 18, curso: curso1)
let alumno3 = Alumno(id: 3, nombre: "alumno3", edad: 18, curso: curso1)
let alumno4 = Alumno(id: 4, nombre: "alumno4", edad: 18, curso: curso1)
let alumno5 = Alumno(id: 5, nombre: "alumno5", edad: 18, curso: curso1)
let alumno6 = Alumno(id: 6, nombre: "alumno6", edad: 18, curso: curso2)
let alumno7 = Alumno(id: 7, nombre: "alumno7", edad: 18, curso: curso3)

curso1.anadirAlumno(alumno: alumno1)
curso1.anadirAlumno(alumno: alumno2)
curso1.anadirAlumno(alumno: alumno3)
curso1.anadirAlumno(alumno: alumno4)
curso1.anadirAlumno(alumno: alumno5)
curso2.anadirAlumno(alumno: alumno6)
curso3.anadirAlumno(alumno: alumno7)

let asignatura1 = Asignatura(id: 1, nombreAsignatura: "asignatura1", curso: curso1)
let asignatura2 = Asignatura(id: 2, nombreAsignatura: "asignatura2", curso: curso1)
let asignatura3 = Asignatura(id: 3, nombreAsignatura: "asignatura3", curso: curso1)
let asignatura4 = Asignatura(id: 4, nombreAsignatura: "asignatura4", curso: curso1)
let asignatura5 = Asignatura(id: 5, nombreAsignatura: "asignatura5", curso: curso1)
let asignatura6 = Asignatura(id: 6, nombreAsignatura: "asignatura6", curso: curso2)
let asignatura7 = Asignatura(id: 7, nombreAsignatura: "asignatura7", curso: curso3)

let colegio1 = Colegio(id: 1, cursos: [curso1, curso2, curso3, curso4, curso5])

struct AsignaturaRepository {
    func getAsignaturas() -> [Asignatura] {
        return [asignatura1, asignatura2, asignatura3, asignatura4, asignatura5, asignatura6, asignatura7]
    }
}

struct AsignaturasService {
    let asignaturaRepository: AsignaturaRepository

    init(asignaturaRepository: AsignaturaRepository) {
        self.asignaturaRepository = asignaturaRepository
    }

    func getAsignaturas() -> [Asignatura] {
        self.asignaturaRepository.getAsignaturas()
    }

    func filterAsignaturasByCurso(_ asignaturas: [Asignatura], curso: Curso) -> [String] {
        asignaturas.filter { $0.curso.id == curso.id }.map { $0.nombreAsignatura }
    }
}

struct CursoRepository {
    func getCursos() -> [Curso] {
        return [curso1, curso2, curso3, curso4, curso5]
    }
}

struct CursoService {
    let cursoRepository: CursoRepository

    init(cursoRepository: CursoRepository) {
        self.cursoRepository = cursoRepository
    }

    func getCursos() -> [Curso] {
        self.cursoRepository.getCursos()
    }
}

struct AlumnoRepository {
    func getAlumnos() -> [Alumno] {
        return [alumno1, alumno2, alumno3, alumno4, alumno5, alumno6, alumno7]
    }
}

struct AlumnoService {
    let alumnoRepository: AlumnoRepository

    init(alumnoRepository: AlumnoRepository) {
        self.alumnoRepository = alumnoRepository
    }

    func getAlumnos() -> [Alumno] {
        self.alumnoRepository.getAlumnos()
    }
}

struct ProfesorRepository {
    func getProfesores() -> [Profesor] {
        return [profesor1, profesor2, profesor3, profesor4]
    }
}

struct ProfesorService {
    let profesorRepository: ProfesorRepository

    init(profesorRepository: ProfesorRepository) {
        self.profesorRepository = profesorRepository
    }

    func getProfesores() -> [Profesor] {
        self.profesorRepository.getProfesores()
    }
}

// Asignaturas que imparte cada profesor
let asignaturasService = AsignaturasService(asignaturaRepository: AsignaturaRepository())
let cursoService = CursoService(cursoRepository: CursoRepository())
let alumnoService = AlumnoService(alumnoRepository: AlumnoRepository())
let profesorService = ProfesorService(profesorRepository: ProfesorRepository())

var profesorAsignaturas: [String: [String]] = [:]
for curso in cursoService.getCursos() {
    let profesor = curso.tutor
    let asignaturas = asignaturasService.getAsignaturas()
    let asignaturasImpartidasEnElCurso = asignaturasService.filterAsignaturasByCurso(asignaturas, curso: curso)

    if asignaturasImpartidasEnElCurso.count > 0 {
        profesorAsignaturas["\(profesor.id)-\(profesor.nombre)", default: []].append(contentsOf: asignaturasImpartidasEnElCurso)
    }
}

// print(profesorAsignaturas)
print("Asignaturas impartidas por cada profesor")
print(profesorAsignaturas)
print("-----------------------------------------")

// Cuantos alumnos tiene cada profesor

var profesorAlumnos: [String: [String]] = [:]
for curso in cursoService.getCursos() {
    let profesor = curso.tutor

    let alumnosEnElCurso = curso.alumnos.map { $0.nombre }
    if alumnosEnElCurso.count > 0 {
        profesorAlumnos["\(profesor.id)-\(profesor.nombre)", default: []].append(contentsOf: alumnosEnElCurso)
    }
}

print("Alumnos que tiene cada profesor")
print(profesorAlumnos)
print("-----------------------------------------")

// Cuantos alumnos distintos hay en el colegio que al menos estén en una asignaturae
var alumns: Set<String> = []
for asignatura in asignaturasService.getAsignaturas() {
    let curso = asignatura.curso
    curso.alumnos.forEach { alumns.insert("\($0.id)-\($0.nombre)") }
}

print(alumns)
