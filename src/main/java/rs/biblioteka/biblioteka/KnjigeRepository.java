package rs.biblioteka.biblioteka;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface KnjigeRepository extends JpaRepository<Knjige, Integer> {
}
