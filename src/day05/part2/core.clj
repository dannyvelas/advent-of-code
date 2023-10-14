(ns day05.part2.core
  (:require [clojure.java.io :as io]
            [clojure.string :as str]))

(def crate-str-len 3)

(defn map-vals [f m]
  (into {} (for [[k v] m] [k (f v)])))

(defn init-vec-of-stacks [stacks-section]
  (let [strings (drop-last (str/split stacks-section #"\n"))
        char-matrix (mapv #(->> (partition crate-str-len (inc crate-str-len) %) ;; step is crate-str-len+1 because there is an empty space between rows
                                (map (fn [col] (nth col 1)))) strings)
        amt-rows (count char-matrix)
        vec-of-stacks (partition amt-rows (apply interleave char-matrix))
        rm'd-spaces (mapv #(filter (partial not= \space) %) vec-of-stacks)]
    rm'd-spaces))

(defn init-cmd-vec [cmd-section]
  (let [split-by-nl (str/split cmd-section #"\n")
        split-by-sp (mapv #(str/split % #" ") split-by-nl)
        vec-of-maps (mapv (fn [v] {:amt (v 1) :from (v 3) :to (v 5)}) split-by-sp)
        vec-of-int-maps (mapv (fn [m] (map-vals #(Integer/parseInt %) m)) vec-of-maps)
        zero-indexed (mapv #(let [dec-from (assoc % :from (dec (% :from)))
                                  dec-to (assoc dec-from :to (dec (% :to)))]
                              dec-to) vec-of-int-maps)]
    zero-indexed))

(defn move [stack-vec cmd]
  (let [from-stack (stack-vec (cmd :from))
        to-stack (stack-vec (cmd :to))
        crates-being-moved (take (cmd :amt) from-stack)
        new-from-stack (drop (cmd :amt) from-stack)
        new-to-stack (concat crates-being-moved to-stack)
        stack-vec-new-from (assoc stack-vec (cmd :from) new-from-stack)
        stack-vec-new-to (assoc stack-vec-new-from (cmd :to) new-to-stack)]
    stack-vec-new-to))

(defn exec-cmds [stack-vec cmds]
  (loop [i 0 stack-vec stack-vec]
    (if (< i (count cmds))
      (let [new-vec (move stack-vec (cmds i))]
        (recur (inc i) new-vec))
      stack-vec)))

(defn -main [& _]
  (let [file-content (slurp (io/resource "05-crates.txt"))
        [stacks-section cmd-section] (str/split file-content #"\n\n")
        stack-vec (init-vec-of-stacks stacks-section)
        cmds (init-cmd-vec cmd-section)
        stack-vec-result (exec-cmds stack-vec cmds)
        top-crates (map first stack-vec-result)
        concatted (apply str top-crates)]
    concatted))
