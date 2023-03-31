<?php

namespace App\Http\Controllers;

use App\Http\Requests\Storeuser_contactsRequest;
use App\Http\Requests\Updateuser_contactsRequest;
use App\Models\user_contacts;

class UserContactsController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Storeuser_contactsRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(user_contacts $user_contacts)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(user_contacts $user_contacts)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Updateuser_contactsRequest $request, user_contacts $user_contacts)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(user_contacts $user_contacts)
    {
        //
    }
}
