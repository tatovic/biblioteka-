package rs.biblioteka.biblioteka;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@NoArgsConstructor
@Getter
@Setter
@Entity(name = "korisnici")
public class Korisnici {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "korisnik_id", nullable = false)
    private Integer id;

    @Column(unique = true)
    private String korisnicko_ime;

    private String lozinka;
    @Column(unique = true)
    private String email;

    private String uloga;
    @Column(nullable = false)
    private LocalDateTime datum_kreiranja = LocalDateTime.now();
}
