<?php
// api/src/Controller/UploadDocumentAction.php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Request;
use App\Entity\Document;
use Symfony\Component\Form\FormFactoryInterface;
use Doctrine\ORM\EntityManagerInterface;
use ApiPlatform\Core\Validator\ValidatorInterface;
use ApiPlatform\Core\Validator\Exception\ValidationException;
use App\Form\DocumentType;

class UploadDocumentAction
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
        // Create a new Document instance
        $document = new Document;
        // Validate the form
        $form = $this->formFactory->create(DocumentType::class, $document);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            // Persist the new Document entity
            $this->entityManager->persist($document);
            $this->entityManager->flush();

            $document->setFile(null);

            return $document;
        }

        // Uploading done for us in background by VichUploader

        // Throw on validation exception, that means something went wrong during form validation
        throw new ValidationException(
            $this->validator->validate($document)
        );
    }
}