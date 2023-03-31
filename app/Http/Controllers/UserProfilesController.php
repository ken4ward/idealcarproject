<?php

namespace App\Http\Controllers;

use App\Http\Requests\Storeuser_profilesRequest;
use App\Http\Requests\Updateuser_profilesRequest;
use App\Models\user_profiles;

class UserProfilesController extends Controller
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
    public function store(Storeuser_profilesRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(user_profiles $user_profiles)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(user_profiles $user_profiles)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Updateuser_profilesRequest $request, user_profiles $user_profiles)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(user_profiles $user_profiles)
    {
        //
    }
}
