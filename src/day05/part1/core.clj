(ns day05.part1.core
  (:require [clojure.java.io :as io]
            [clojure.string :as str]))

(def crate-str-len 3)

(defn map-vals [f m]
  (into {} (for [[k v] m] [k (f v)])))

(defn init-vec-of-stacks [stacks-section]
  (let [strings (drop-last (str/split stacks-section #"\n"))
        col-groups (mapv #(->> (partition crate-str-len (inc crate-str-len) %) ;; step is crate-str-len+1 because there is an empty space between rows
                               (map (fn [col] (nth col 1)))) strings)
        amt-rows (count col-groups)
        vec-of-stacks (partition amt-rows (apply interleave col-groups))
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

(defn move [stack-vec from-index to-index]
  (let [from-stack (stack-vec from-index)
        to-stack (stack-vec to-index)
        crate-being-moved (peek from-stack)
        new-from-stack (pop from-stack)
        new-to-stack (conj to-stack crate-being-moved)
        stack-vec-new-from (assoc stack-vec from-index new-from-stack)
        stack-vec-new-to (assoc stack-vec-new-from to-index new-to-stack)]
    stack-vec-new-to))

(defn exec-cmd [stack-vec cmd]
  (loop [i 0 stack-vec stack-vec]
    (if (< i (cmd :amt))
      (let [new-stack-vec (move stack-vec (cmd :from) (cmd :to))]
        (recur (inc i) new-stack-vec))
      stack-vec)))

(defn exec-cmds [stack-vec cmds]
  (loop [i 0 stack-vec stack-vec]
    (if (< i (count cmds))
      (let [new-map (exec-cmd stack-vec (cmds i))]
        (recur (inc i) new-map))
      stack-vec)))

(defn -main [& _]
  (let [file-content (slurp (io/resource "05-crates.txt"))
        [stacks-section cmd-section] (str/split file-content #"\n\n")
        stack-vec (init-vec-of-stacks stacks-section)
        cmds (init-cmd-vec cmd-section)
        stack-vec-result (exec-cmds stack-vec cmds)
        top-crates (mapv peek stack-vec-result)
        concatted (apply str top-crates)]
    concatted))
