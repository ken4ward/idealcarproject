<?php

namespace App\Http\Controllers;

use App\Http\Requests\Storefuel_entriesRequest;
use App\Http\Requests\Updatefuel_entriesRequest;
use App\Models\fuel_entries;

class FuelEntriesController extends Controller
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
    public function store(Storefuel_entriesRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(fuel_entries $fuel_entries)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(fuel_entries $fuel_entries)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Updatefuel_entriesRequest $request, fuel_entries $fuel_entries)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(fuel_entries $fuel_entries)
    {
        //
    }
}
