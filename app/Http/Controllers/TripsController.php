<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoretripsRequest;
use App\Http\Requests\UpdatetripsRequest;
use App\Models\trips;

class TripsController extends Controller
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
    public function store(StoretripsRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(trips $trips)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(trips $trips)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdatetripsRequest $request, trips $trips)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(trips $trips)
    {
        //
    }
}
