package rs.biblioteka.biblioteka;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@NoArgsConstructor
@Getter
@Setter
@Entity(name = "rezervacije")
public class Rezervacije {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rezervacija_id", nullable = false)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "korisnik_id", nullable = false)
    private Korisnici korisnik;

    @ManyToOne
    @JoinColumn(name = "knjiga_id", nullable = false)
    private Knjige knjiga;

    @Column(nullable = false)
    private LocalDate datum_rezervacije;

    @Column(nullable = false)
    private String status;
}
