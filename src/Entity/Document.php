<?php

namespace App\Entity;

use ApiPlatform\Core\Annotation\ApiResource;
use Doctrine\ORM\Mapping as ORM;
use Vich\UploaderBundle\Mapping\Annotation as Vich;
use Symfony\Component\Validator\Constraints as Assert;
use App\Controller\UploadDocumentAction;

/**
 * @ORM\Entity()
 * @Vich\Uploadable()
 * @ApiResource(
 *      attributes={"order"={"id" : "ASC"}},
 *      collectionOperations={
 *          "get",
 *          "post"={
 *              "method"="POST",
 *              "path"="/documents",
 *              "controller"=UploadDocumentAction::class,
 *              "defaults"={"_api_receive"=false}
 *          }
 *      }
 * )
 */
class Document
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @Vich\UploadableField(mapping="documents", fileNameProperty="url")
     * @Assert\NotNull()
     */
    private $file;

    /**
     * @ORM\Column(nullable=true)
     */
    private $url;

    public function getId()
    {
        return $this->id;
    }

    public function getFile()
    {
        return $this->file;
    }

    public function setFile($file)
    {
        $this->file = $file;

        return $this;
    }

    public function getUrl()
    {
        return '/documents/' . $this->url;
    }

    public function setUrl($url)
    {
        $this->url = $url;

        return $this;
    }
}