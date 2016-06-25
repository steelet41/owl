module M = Matrix.Matrix
module L = Learn.Cluster

let test_op s c op =
  let ttime = ref 0. in
  for i = 1 to c do
    let t0 = Unix.gettimeofday () in
    let _ = op () in
    let t1 = Unix.gettimeofday () in
    ttime := !ttime +. (t1 -. t0)
  done;
  let _ = ttime := !ttime /. (float_of_int c) in
  Printf.printf "| %s :\t %.4fs \n" s !ttime;
  flush stdout

let test_kmeans () =
  let z1 = M.random 10 2 in
  let z2 = M.random 10 2 in
  let z3 = M.((z1 +$ 50.) @= z2) in
  let z3 = M.random 100000 3 in
  L.kmeans z3 3

let _ =
  let m, n = 5000, 5000 and c = 1 in
  print_endline (Bytes.make 60 '+');
  Printf.printf "| test matrix size: %i x %i    exps: %i\n" m n c;
  print_endline (Bytes.make 60 '-');
  (* let x, y = (M.random m n), (M.random m n) in
  test_op "pretty print    " c (fun () -> M.pprint x);
  test_op "load matrix    " c (fun () -> M.load "zmatrix.txt"); *)
  print_endline (Bytes.make 60 '+');
  test_kmeans ();
