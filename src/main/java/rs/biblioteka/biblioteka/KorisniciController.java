package rs.biblioteka.biblioteka;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "/korisnici")
@RequiredArgsConstructor
public class KorisniciController {

    private final KorisniciRepository repository;

    @GetMapping
    public List<Korisnici> getAllKorisnici() {
        return repository.findAll();
    }

    @GetMapping(path = "/{id}") // Ispravljena ruta
    public ResponseEntity<Korisnici> getKorisnikById(@PathVariable Integer id) {
        return ResponseEntity.of(repository.findById(id));
    }
}
