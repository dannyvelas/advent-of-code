(ns day05.part2.core
  (:require [clojure.java.io :as io]
            [clojure.string :as str]))

(def crate-str-len 4)

(defn map-vals [f m]
  (into {} (for [[k v] m] [k (f v)])))

(defn calc-amt-stacks [stacks-section]
  (let [single-line (get (str/split stacks-section #"\n") 0)]
    (int (Math/ceil (/ (count single-line) crate-str-len)))))

(defn init-vec-of-stacks [stacks-section]
  (let [amt-stacks (calc-amt-stacks stacks-section)
        strings (drop-last (str/split stacks-section #"\n"))
        col-groups (mapv (fn [string]
                           (let [cols-of-one-row (partition crate-str-len string)
                                 trimmed-col-group (map (fn [col] (nth col 1)) cols-of-one-row)] trimmed-col-group)) strings)]
    col-groups))

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
        ;;cmds (init-cmd-vec cmd-section)
        ;;stack-vec-result (exec-cmds stack-vec cmds)
        ;;top-crates (map first stack-vec-result)
        ;;concatted (apply str top-crates)
        ]
    stack-vec))
