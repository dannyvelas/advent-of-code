(ns day01.part1.core
  (:gen-class)
  (:require [clojure.java.io :as io]
            [clojure.string :as str]))

(defn to-int [v]
  (if (= v "") 0
      (Integer/parseInt v)))

(defn -main [& _]
  (->> (str/split (slurp (io/resource "01-calories.txt")) #"\n")
       (partition-by (partial = ""))
       (map (partial map to-int))
       (map (partial reduce +))
       (apply max)))
