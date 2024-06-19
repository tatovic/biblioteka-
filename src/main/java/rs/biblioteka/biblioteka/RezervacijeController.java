package rs.biblioteka.biblioteka;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "/rezervacija")
@RequiredArgsConstructor
public class RezervacijeController {

    private final RezervacijeRepository repository;

    @GetMapping
    public List<Rezervacije> getAllRezervacije() {
        return repository.findAll();
    }
}