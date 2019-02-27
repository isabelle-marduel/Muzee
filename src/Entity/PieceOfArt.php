<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use ApiPlatform\Core\Annotation\ApiSubresource;
use ApiPlatform\Core\Annotation\ApiProperty;
use ApiPlatform\Core\Annotation\ApiFilter;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\File;
use Vich\UploaderBundle\Mapping\Annotation as Vich;
use App\Entity\Image;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Symfony\Component\Serializer\Annotation\Groups;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\SearchFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\RangeFilter;
use ApiPlatform\Core\Bridge\Doctrine\Orm\Filter\OrderFilter;

/**
 * @ApiResource(
 *      attributes={"order"={"id" : "DESC"}},
 * )
 * @ApiFilter(
 *      SearchFilter::class,
 *      properties={
 *          "id": "exact",
 *          "title": "partial",
 *          "subtitle": "partial",
 *          "author": "partial",
 *          "datation": "partial",
 *          "origin": "partial",
 *          "originDetail": "partial",
 *          "material": "partial",
 *          "latitude": "exact",
 *          "longitude": "exact"
 *      }
 * )
 * @ApiFilter(RangeFilter::class, properties={"id"})
 * @ApiFilter(
 *      OrderFilter::class,
 *      properties={
 *          "title",
 *          "subtitle",
 *          "author",
 *          "datation",
 *          "origin",
 *          "originDetail",
 *          "material",
 *          "latitude",
 *          "longitude"
 *      }
 * )
 * @ORM\Entity(repositoryClass="App\Repository\PieceOfArtRepository")
 */
class PieceOfArt
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
    private $title;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $subtitle;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $author;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $datation;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $origin;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $originDetail;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $material;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $sizes;

    /**
     * @ORM\Column(type="text", nullable=true)
     */
    private $content;

    /**
     * @ORM\Column(type="float")
     */
    private $latitude;

    /**
     * @ORM\Column(type="float")
     */
    private $longitude;

    /**
     * @ORM\ManyToMany(targetEntity = "App\Entity\Image")
     * @ORM\JoinTable()
     * @ApiSubresource()
     * @Groups({"post"})
     */
    private $images;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Museum", inversedBy="piecesOfArt")
     * @ORM\JoinColumn(nullable=true, onDelete="SET NULL")
     */
    private $museum;

    /**
     * @ORM\OneToOne(targetEntity="App\Entity\Image", cascade={"persist", "remove"})
     * @ORM\JoinColumn(nullable=false)
     */
    private $mainImage;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Video")
     * @ORM\JoinTable()
     * @ApiSubresource()
     * @Groups({"post"})
     */
    private $videos;

    /**
     * @ORM\ManyToMany(targetEntity="App\Entity\Document")
     * @ORM\JoinTable()
     * @ApiSubresource()
     * @Groups({"post"})
     */
    private $documents;

    public function __construct()
    {
        $this->images = new ArrayCollection();
        $this->videos = new ArrayCollection();
        $this->documents = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    public function getSubtitle(): ?string
    {
        return $this->subtitle;
    }

    public function setSubtitle(?string $subtitle): self
    {
        $this->subtitle = $subtitle;

        return $this;
    }

    public function getAuthor(): ?string
    {
        return $this->author;
    }

    public function setAuthor(?string $author): self
    {
        $this->author = $author;

        return $this;
    }

    public function getDatation(): ?string
    {
        return $this->datation;
    }

    public function setDatation(string $datation): self
    {
        $this->datation = $datation;

        return $this;
    }

    public function getOrigin(): ?string
    {
        return $this->origin;
    }

    public function setOrigin(string $origin): self
    {
        $this->origin = $origin;

        return $this;
    }

    public function getOriginDetail(): ?string
    {
        return $this->originDetail;
    }

    public function setOriginDetail(?string $originDetail): self
    {
        $this->originDetail = $originDetail;

        return $this;
    }

    public function getMaterial(): ?string
    {
        return $this->material;
    }

    public function setMaterial(string $material): self
    {
        $this->material = $material;

        return $this;
    }

    public function getSizes(): ?string
    {
        return $this->sizes;
    }

    public function setSizes(string $sizes): self
    {
        $this->sizes = $sizes;

        return $this;
    }

    public function getContent(): ?string
    {
        return $this->content;
    }

    public function setContent(?string $content): self
    {
        $this->content = $content;

        return $this;
    }

    public function getLatitude()
    {
        return $this->latitude;
    }

    public function setLatitude($latitude)
    {
        $this->latitude = $latitude;

        return $this;
    }

    public function getLongitude()
    {
        return $this->longitude;
    }

    public function setLongitude($longitude)
    {
        $this->longitude = $longitude;

        return $this;
    }

    public function getImages(): Collection
    {
        return $this->images;
    }

    public function addImage(Image $image)
    {
        if (!$this->images->contains($image)) {
            $this->images[] = $image;
        }

        return $this;
    }

    public function removeImage(Image $image)
    {
        if ($this->images->contains($image)) {
            $this->images->removeElement($image);
        }

        return $this;
    }

    public function getMuseum(): ?Museum
    {
        return $this->museum;
    }

    public function setMuseum(?Museum $museum): self
    {
        $this->museum = $museum;

        return $this;
    }

    public function getMainImage(): ?Image
    {
        return $this->mainImage;
    }

    public function setMainImage(Image $mainImage): self
    {
        $this->mainImage = $mainImage;

        return $this;
    }

    /**
     * @return Collection|Video[]
     */
    public function getVideos(): Collection
    {
        return $this->videos;
    }

    public function addVideo(Video $video): self
    {
        if (!$this->videos->contains($video)) {
            $this->videos[] = $video;
        }

        return $this;
    }

    public function removeVideo(Video $video): self
    {
        if ($this->videos->contains($video)) {
            $this->videos->removeElement($video);
        }

        return $this;
    }

    /**
     * @return Collection|Document[]
     */
    public function getDocuments(): Collection
    {
        return $this->documents;
    }

    public function addDocument(Document $document): self
    {
        if (!$this->documents->contains($document)) {
            $this->documents[] = $document;
        }

        return $this;
    }

    public function removeDocument(Document $document): self
    {
        if ($this->documents->contains($document)) {
            $this->documents->removeElement($document);
        }

        return $this;
    }
}
