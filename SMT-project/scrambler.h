/* -*- C++ -*-
 *
 * A simple scrambler for SMT-LIB v2 scripts
 * 
 * Author: Alberto Griggio <griggio@fbk.eu>
 *
 * Copyright (C) 2011 Alberto Griggio
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
#ifndef SCRAMBLER_H_INCLUDED
#define SCRAMBLER_H_INCLUDED

#include <vector>
#include <string>

extern int counter_total_elements;
extern int counter_of_symbols;
extern int counter_declare_fun;
extern int counter_declare_sort;
extern int counter_assertions;
extern int counter_check_sat;
//extern int counter_argument;  // THIS IS A USELESS AND NOT IMPLEMENTED COUNTER
extern int counter_push;
extern int counter_pop;
extern int counter_let_bindings;
extern int counter_forall;
extern int counter_exists;

/*
extern int status_sat;
extern int status_unsat;
extern int status_unknown;
extern int status_missing;
*/
extern int status; //0 - missing; 1 - sat; 2 -unsat; 3 - unknown

extern int counter_core_true;
extern int counter_core_false;
extern int counter_core_not;
extern int counter_core_imply;
extern int counter_core_and;
extern int counter_core_or;
extern int counter_core_xor;
extern int counter_core_distinct;

extern int counter_mult;
extern int counter_plus;
extern int counter_equals;
extern int counter_int_le_or_gr;
extern int counter_int_leq_or_grq;
extern int bv_counter_bvand;
extern int bv_counter_bvor;
extern int bv_counter_bvxor;
extern int bv_counter_bvnand;
extern int bv_counter_bvnor;
extern int bv_counter_bvcomp;
extern int bv_counter_bvadd;
extern int bv_counter_bvmul;

extern int counter_bitvector_bvs_l_g;
extern int counter_bitvector_bvs_le_ge;
extern int counter_bitvector_bvu_l_g;
extern int counter_bitvector_bvu_le_ge;

//extern char *defined_func;

namespace scrambler {

struct node {
    std::string symbol;
    std::vector<node *> children;
    bool needs_parens;

    void add_children(std::vector<node *> *c);

    void set_parens_needed(bool b) { needs_parens = b; }
};

extern int name_idx;

void set_new_name(const char *n);
void push_namespace();
void pop_namespace();

void add_node(const char *s,
              node *n1=NULL, node *n2=NULL, node *n3=NULL, node *n4=NULL);

node *make_node(const char *s=NULL, node *n1=NULL, node *n2=NULL);
node *make_node(std::vector<node *> *v);
node *make_node(node *n, std::vector<node *> *v);
void del_node(node *n);

void set_seed(int n);
void shuffle_list(std::vector<node *> *v);
bool is_commutative(node *n);
bool is_commutative2(node *n);
bool flip_antisymm(node *n, node **out_n);

} // namespace scrambler

char *c_strdup(const char *s);

#endif // SCRAMBLER_H_INCLUDED
