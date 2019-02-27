<?php
// api/src/Controller/UploadVideoAction.php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Request;
use App\Entity\Video;
use Symfony\Component\Form\FormFactoryInterface;
use Doctrine\ORM\EntityManagerInterface;
use ApiPlatform\Core\Validator\ValidatorInterface;
use ApiPlatform\Core\Validator\Exception\ValidationException;
use App\Form\VideoType;

class UploadVideoAction
{
    public function __construct(
        FormFactoryInterface $formFactory,
        EntityManagerInterface $entityManager,
        ValidatorInterface $validator
    )
    {
        $this->formFactory = $formFactory;
        $this->entityManager = $entityManager;
        $this->validator = $validator;

    }

    public function __invoke(Request $request)
    {
        // Create a new Video instance
        $video = new Video;
        // Validate the form
        $form = $this->formFactory->create(VideoType::class, $video);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            // Persist the new Video entity
            $this->entityManager->persist($video);
            $this->entityManager->flush();

            $video->setFile(null);

            return $video;
        }

        // Uploading done for us in background by VichUploader

        // Throw on validation exception, that means something went wrong during form validation
        throw new ValidationException(
            $this->validator->validate($video)
        );
    }
}