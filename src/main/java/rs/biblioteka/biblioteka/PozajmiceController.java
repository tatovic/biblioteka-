package rs.biblioteka.biblioteka;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(path = "/pozajmica")
@RequiredArgsConstructor
public class PozajmiceController {

    private final PozajmiceRepository repository;

    @GetMapping
    public List<Pozajmice> getAllPozajmice() {
        return repository.findAll();
    }
}
