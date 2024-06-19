package rs.biblioteka.biblioteka;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@NoArgsConstructor
@Getter
@Setter
@Entity(name = "pozajmice")
public class Pozajmice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "pozajmica_id", nullable = false)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "korisnik_id", nullable = false)
    private Korisnici korisnik;

    @ManyToOne
    @JoinColumn(name = "knjiga_id", nullable = false)
    private Knjige knjiga;

    @Column(nullable = false)
    private LocalDate datum_pozajmice;

    private LocalDate datum_vracanja;

    @Column(nullable = false)
    private LocalDate datum_isteka;
}
