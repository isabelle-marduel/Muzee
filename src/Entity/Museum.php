<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use ApiPlatform\Core\Annotation\ApiFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\RangeFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ApiResource()
 * @ApiFilter(
 *      SearchFilter::class,
 *      properties={
 *          "id": "exact",
 *          "name": "partial",
 *          "city": "partial",
 *          "zipCode": "partial",
 *          "latitude": "exact",
 *          "longitude": "exact"
 *      }
 * )
 * @ApiFilter(RangeFilter::class, properties={"id"})
 * @ApiFilter(
 *      OrderFilter::class,
 *      properties={
 *          "name",
 *          "zipCode",
 *          "city",
 *          "latitude",
 *          "longitude"
 *      }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\MuseumRepository")
 */
class Museum
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $address;

    /**
     * @ORM\Column(type="integer")
     */
    private $zipCode;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $city;

    /**
     * @ORM\Column(type="float")
     */
    private $latitude;

    /**
     * @ORM\Column(type="float")
     */
    private $longitude;

    /**
     * @ORM\OneToMany(targetEntity="App\Entity\PieceOfArt", mappedBy="museum")
     */
    private $piecesOfArt;

    public function __construct()
    {
        $this->piecesOfArt = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getAddress(): ?string
    {
        return $this->address;
    }

    public function setAddress(string $address): self
    {
        $this->address = $address;

        return $this;
    }

    public function getZipCode(): ?int
    {
        return $this->zipCode;
    }

    public function setZipCode(int $zipCode): self
    {
        $this->zipCode = $zipCode;

        return $this;
    }

    public function getCity(): ?string
    {
        return $this->city;
    }

    public function setCity(string $city): self
    {
        $this->city = $city;

        return $this;
    }

    public function getLatitude(): ?float
    {
        return $this->latitude;
    }

    public function setLatitude(float $latitude): self
    {
        $this->latitude = $latitude;

        return $this;
    }

    public function getLongitude(): ?float
    {
        return $this->longitude;
    }

    public function setLongitude(float $longitude): self
    {
        $this->longitude = $longitude;

        return $this;
    }

    /**
     * @return Collection|PieceOfArt[]
     */
    public function getPiecesOfArt(): Collection
    {
        return $this->piecesOfArt;
    }

    public function addPiecesOfArt(PieceOfArt $piecesOfArt): self
    {
        if (!$this->piecesOfArt->contains($piecesOfArt)) {
            $this->piecesOfArt[] = $piecesOfArt;
            $piecesOfArt->setMuseum($this);
        }

        return $this;
    }

    public function removePiecesOfArt(PieceOfArt $piecesOfArt): self
    {
        if ($this->piecesOfArt->contains($piecesOfArt)) {
            $this->piecesOfArt->removeElement($piecesOfArt);
            // set the owning side to null (unless already changed)
            if ($piecesOfArt->getMuseum() === $this) {
                $piecesOfArt->setMuseum(null);
            }
        }

        return $this;
    }
}
