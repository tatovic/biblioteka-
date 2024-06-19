package rs.biblioteka.biblioteka;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "/knjiga")
@RequiredArgsConstructor
public class KnjigeController {

    private final KnjigeRepository repository;

    @GetMapping
    public List<Knjige> getAllKnjige() {
        return repository.findAll();
    }
}
